# encoding: UTF-8
class ReportsController < ApplicationController
  def index
  end
  def showreport
      @fromdate = params[:fromdate]
      @todate = params[:todate]
      code='\documentclass[12pt,a4paper]{article}
            \usepackage{fullpage}
            \usepackage{fontspec}
            \usepackage{polyglossia}
            \setdefaultlanguage{malayalam}
            \setmainfont[Script=Malayalam, HyphenChar="0000]{Rachana}
            \usepackage{titling}
            \usepackage{datetime}
            \setlength{\droptitle}{-10em} 
            \title{\textbf{ താളിയോല \vspace{-2ex}}}
            \author{Statistical Report Generated On}
            \date{\today \ - \currenttime}
            \newcommand{\tab}{\hspace*{8em}}
            \begin{document}
            \maketitle
            \begin{center}' + @fromdate.to_s + ' to ' + @todate.to_s + '\end{center}
            \begin{flushleft}
                \begin{tabbing}
                    \hspace{1.5in} \= \hspace{1in}\= \kill
                    Total Number of Books \>\> : '+Book.all.count.to_s+'\\\\
                    Total Number of Categories \>\> : '+Category.all.count.to_s+'\\\\
                    Total Number of Authors \>\> : '+Author.all.count.to_s+'\\\\\\\\'
      countbooks = Book.where("created_at > ? AND created_at < ?",@fromdate.to_s,@todate.to_s).count.to_s
      countusers = User.where("created_at > ? AND created_at < ?",@fromdate.to_s,@todate.to_s).count.to_s
      code = code + 'Books added \>\> : ' + countbooks.to_s + '\\\\' + 'Users Registered \>\> : ' + countusers.to_s + '\\\\'

      code = code + '\end{tabbing}'
      code = code + '\end{flushleft}\end{document}'
      @latex_config={:command => 'xelatex',:parse_twice => true} 
      result = LatexToPdf.generate_pdf(code, @latex_config, parse_twice = true) # raise result.inspect 
      filename = Time.now.strftime("%Y_%m_%d_%H_%M_%S") + ".pdf"
      path="Reports/"+filename
      File.open(Rails.root.join("public","Reports",filename), "w") do |f| 
          f.puts result 
      end 
      redirect_to root_path+path
  end
end
