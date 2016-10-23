  require 'smarter_csv'
  options = {:keep_original_headers => true,  :col_sep => ';'}
  SmarterCSV.process('docs/obsam.csv', options) do |chunk|
    chunk.each do |data_hash|
      Dispositivo.create!( data_hash )
    end
  end
