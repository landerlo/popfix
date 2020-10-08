local function min(a, b)
	if a < b then return a
	else return b
	end
end

-- returns distance between s1 and s2
-- param s1 : string
-- param s2 : string
return function(s1, s2)
	if s1 == s2 then return 0 end
	if s1:len() == 0 then return s2:len() end
	if s2:len() == 0 then return s1:len() end
	if s2:len() < s1:len() then s1, s2 = s2, s1 end  -- takes less space

	local len1 = #s1
	local len2 = #s2

	local store = {}
	store[1] = {}
	store[2] = {}

	for i = 1, len1+1 do
		store[1][i] = 0
		store[2][i] = 0
	end

	for i = 2, len2 + 1 do
		for j = 1, len1 + 1 do
			if j == 1 then
				store[(i % 2) + 1][j] = i;
			elseif s1:sub(j-1 , j-1) == s2:sub(i-1 , i-1) then
				store[(i % 2) + 1][j] = store[((i - 1) % 2) + 1][j - 1];
			else
				store[(i % 2) + 1][j] = 1 +
				min(store[((i - 1) % 2) + 1][j],
				min(store[(i % 2) + 1][j - 1],
				store[((i - 1) % 2) + 1][j - 1]))
			end

		end
	end
	return store[len2 % 2 + 1][len1]
end
