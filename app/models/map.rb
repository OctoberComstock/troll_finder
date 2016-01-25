require 'csv'

class String
  # Got this little trick from StackOverflow
  def valid_float?
    !!Float(self) rescue false
  end
end

class Map < ActiveRecord::Base
  has_many :points
  has_many :trolls
  # mount_uploader :point_collection, PointCollectionUploader

  def self.gen_from_params(params)
    map = Map.new

    map.name = params[:map][:name]
    map.description = params[:map][:description]

    map.save

    csv_string = params[:map][:point_collection].read

    if !csv_string.empty?
      gen_from_csv_file(map, csv_string)
    else
      map
    end
  end




  def self.gen_from_csv_file(map, string)
    CSV
      .parse(string, {:headers => true, :header_converters => :symbol})
      .each_with_index do |row, i|
        line_number = i + 1
        if row.nil? || row.empty?
          map.trolls.new(line: line_number, data: "Blank Line")
        elsif (row.all?{ |value| value[1].valid_float? && !value[1].nil? })
          map.points.new(lat: row[:latitude], long: row[:longitude])
        else
          # Error on this line
          map.trolls.new(line: line_number, data: row.to_s)
        end
    end

    map.save
    map
  end
end
