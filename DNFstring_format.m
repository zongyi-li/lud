function [DNFstring] = DNFstring_format(x1_value, x1_index, x2_value, x2_index)
    DNFstring = '';
    if x1_value == 0
    	DNFstring = strcat(DNFstring, 'not x'); 
    else
        DNFstring = strcat(DNFstring, 'x');  
    end
    DNFstring = strcat(DNFstring, string(x1_index));
    if x2_value == 0
        DNFstring = strcat(DNFstring, ' and not x'); 
    else
       	DNFstring = strcat(DNFstring, ' and x');  
    end
   	DNFstring = strcat(DNFstring, string(x2_index));
end