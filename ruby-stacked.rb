#! /usr/bin/env ruby
require 'green_shoes'

Shoes.app title: 'StackEd', width: 350, height: 350 do
    def autofix
        @edit_content.text = @edit_content.text.gsub(/\bur\b/,"your")
    end

    def changecase(casepref)
        if casepref == "caps"
            @edit_content.text = @edit_content.text.capitalize
        end
    end
    stack margin: 10 do
        flow do
            @autofix = button "Autofix"
            @autofix.click { autofix }  
            @autofix = button "Capitalize" 
            @autofix.click { changecase("caps") }
	    end
        stack margin: 5 do
                @edit_content = edit_box width: 300, height: 250
        end
    end   
end
