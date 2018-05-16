function [DNFstring] = printPlantedDNF(DNF)
    DNFstring = '';
    for i = 1:size(DNF, 1)
        term = DNF(i,:);
        t1 = term(1); t2 = term(2);
        x1_value = mod(t1,2);
        x1_index = (t1-x1_value)/2 + 1;
        x2_value = mod(t2,2);
        x2_index = (t2-x2_value)/2 + 1;
        if i == 1
            DNFstring = strcat(DNFstring, "(", ...
            DNFstring_format(x1_value, x1_index, x2_value, x2_index), ")");
        else
            DNFstring = strcat(DNFstring, ", (", ...
            DNFstring_format(x1_value, x1_index, x2_value, x2_index) + ")");
        end
    end
end
