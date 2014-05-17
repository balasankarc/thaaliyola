module ApplicationHelper
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
