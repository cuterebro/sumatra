module FeedHelper
  TIME_TABLE = [60, 24, 365].reduce([60]) { |arr, x| arr.push(arr.last * x) }.zip(['m', 'h', 'd', 'y']).reverse.freeze

  def time_ago_string(time)
    diff = (Time.now - time).to_i
    TIME_TABLE.each do |secs, char|
      val = diff / secs
      return "#{val}#{char} ago" if val > 0
    end
    'Now'
  end
end
