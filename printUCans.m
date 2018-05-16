function [] = printUCans(UCans, DNFtable)
    if ~isempty(UCans)
        for i = 1:length(UCans)
            % display u, c, error
            if size(UCans{i}.u,2) == 0
                ustr = 'u: []';
            else
                ustr = strcat('u: [', string(UCans{i}.u(1)));
                for j=2:size(UCans{i}.u,2)
                    ustr = strcat(ustr, ", ", string(UCans{i}.u(j)));
                end
                ustr = strcat(ustr, ']');
            end

            if size(UCans{i}.c,2) == 0
                cstr = 'c: []';
            else
                cterm = string(DNFtable{UCans{i}.c(1),1});
                cstr = strcat('c: [(', string(UCans{i}.c(1)), ", ", cterm, ")");
                % check what DNF c is 
                for j=2:size(UCans{i}.c,2)
                    cterm = string(DNFtable{UCans{i}.c(j),1});
                    cstr = strcat(cstr, ", (", string(UCans{i}.c(j)),", ", cterm, ")");
                end
                cstr = strcat(cstr, ']');
            end

            estr = strcat('error: ', string(UCans{i}.error));
            fprintf('%s\n%s\n%s\n\n', ustr, cstr, estr);
            %disp(UCans{i});
        end
    end
end