function align(V1, V2, id)
    tic; disp('computing alignment matrix...');
    figure(id); clf;
    F = V1' * V2;
    imagesc(abs(F));
    toc;
end