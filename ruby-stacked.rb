#! /usr/bin/env ruby
require 'green_shoes'

Shoes.app title: 'StackEd', width: 350, height: 350 do
    def autofix
        content = @edit_content.text
        content = content.gsub(/\bur\b/,"your")
        content = content.gsub(/\bi( |')/i,"I\\1");
        content = content.gsub(/\bi ?m\b/i,"I'm");
        content = content.gsub(/\bu\b/i,"you");
        content = content.gsub(/\bur\b/i,"your");
        content = content.gsub(/\bcud\b/i,"could");
        content = content.gsub(/\bc(o|u)z\b/i,"because");
        content = content.gsub(/\bb4\b/i,"before");
        content = content.gsub(/\bpl[sz]\b/i,"please");
        content = content.gsub(/\binternet\b/,"Internet");
        content = content.gsub(/\bub[a|u|o]nt[u|o]\b/,"Ubuntu");
        content = content.gsub(/\bwin ?7\b/i,"Windows 7");
        content = content.gsub(/\bwin ?xp\b/i,"Windows XP");
        content = content.gsub(/\bwin\w*\b/i,"Windows");
        content = content.gsub(/\bandroid\b/,"Android");
        content = content.gsub(/\bgoogle\b/,"Google");
        content = content.gsub(/\bOracle\b/,"Oracle");
        content = content.gsub(/\bgmail\b/,"Gmail");
        content = content.gsub(/\bpaypal\b/,"PayPal");
        content = content.gsub(/\beclipse\b/,"Eclipse");
        content = content.gsub(/\bjava\b/i,"Java");
        content = content.gsub(/\bstackoverflow\b/i,"Stack Overflow");
        content = content.gsub(/\bpl[ |\/|-]?sql\b/,"PL/SQL");
        content = content.gsub(/\bt[ |\/|-]?sql\b/,"T-SQL");
        content = content.gsub(/\b(can|doesn|don|won|hasn|isn|didn)t\b/,"\\1't");
        content = content.gsub(/\b(a)n(?= +(?![aeiou]|HTML|user))/i,"\\1");
        content = content.gsub(/\b(a)(?= +[aeiou](?!ser))/i,"\\1n");
        content = content.gsub(/\b(a)lot/i,"");
        content = content.gsub(/^(hi|thx|thanks?|cheers|thanx|tia)\s?((in advance)|you)?[\.\!\,]*/i,"");    
        content = content.gsub(/[ ]*([\?\!] ?)+ */,"\\1 ");
        @edit_content.text = content
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
    @edit_content.focus   
end
