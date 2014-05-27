module ChartsHelper
  def data_chart( data )
    stream = '['
    data.each do |d|
      stream += '['
      stream += (d.created_at.to_i * 1000).to_s
      stream += ','
      stream += (number_with_precision(d.weight/ ((d.height/100.0) * (d.height/100.0) ) )).to_s
      stream += '] ,'
    end
    stream[stream.size-1] = ']'
    return stream
  end
end
