#! /usr/bin/env ruby
require 'green_shoes'

Shoes.app title: 'StackEd', width: 350, height: 350 do
    def autofix
        @edit_content.text = "blargh"
    end

    def changecase
        @edit_content.text = "changed"
    end
    stack margin: 10 do
    flow do
    
            @autofix = button "Autofix"
            @autofix.click { autofix }
  
         @autofix = button "Change case" 
         @autofix.click { changecase }
	end
    stack margin: 5 do
            @edit_content = edit_box width: 300, height: 250
        end
    end   
end
