class TextStat < ActiveRecord::Base
  
  require "rinruby"
  attr_accessible :content, :name

  after_save :update_plot 


  def update_plot
    tally = Hash.new(0)
    content.each_line do |line|
      line.downcase.split(/\W+/).each { |w| tally[w] += 1 }
    end
    total = tally.values.inject { |sum,count| sum + count }
    tally.delete_if { |key,count| count < 3 || key.length < 4 }
    R.keys, R.counts = tally.keys, tally.values

    p = Pathname.new("public/images/#{id}")
    p.mkdir unless p.exist?

    R.eval <<EOF
      names(counts) <- keys
      jpeg("public/images/#{id}/barplot.jpg")
      barplot(rev(sort(counts)),main="Frequency of Non-Trivial Words",las=2)
      mtext("Among the #{total} words in the Gettysburg Address",3,0.45)
      rho <- round(cor(nchar(keys),counts),4)
      dev.off()
EOF
  end
end
