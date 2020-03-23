function algos = algorithms()
    % ALGORITHMS Returns available hashing algorithms.
    jalgos = javaMethod ('getAlgorithms', 'java.security.Security', "MessageDigest");
    ajalgos = javaMethod('toArray', jalgos);
    algos = java_array_to_matlab_struct(ajalgos);
end
function st = java_array_to_matlab_struct(ja)
    st = struct();
    for kk = 1:length(ja)
        item = ja(kk);
        fieldname = genvarname(strrep(item, '-', '_'));
        st.(fieldname) = item;
    end
end
