module ApplicationHelper
        def lesc(text)
            LatexToPdf.escape_latex(text)
        end    
        
        def signinnotice(str)
        if str="" 
            if notice!=""
                return notice
            else
                return ""
            end
        else
            notice=str
        end
    end

end
