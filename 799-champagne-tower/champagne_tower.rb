def champagne_tower(poured, query_row, query_glass)
  champagne = Array.new(query_row + 1) { |i| Array.new(i + 1, 0) }
  champagne[0][0] = poured
  (0...query_row).each do |row|
    (0...champagne[row].length).each do |glass|
      excess = (champagne[row][glass] - 1) / 2.0
      if excess.positive?
        champagne[row + 1][glass] += excess
        champagne[row + 1][glass + 1] += excess
      end
    end
  end
  [champagne[query_row][query_glass], 1].min
end
