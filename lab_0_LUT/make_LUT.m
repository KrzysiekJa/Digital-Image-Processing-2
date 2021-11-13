function LUT = make_LUT(in_function)

LUT = 0:255;
multipier = max(LUT)/in_function(max(LUT));

for i = 1:length(LUT)
    LUT(i) = uint8(in_function(i) * multipier);
end

end

