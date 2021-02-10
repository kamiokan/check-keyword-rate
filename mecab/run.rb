require 'natto'

txt = 'Rubyで日本語で形態素解析をしようと思う。なぜRubyかって？だって、せっかく日本語の解析を行うんだから、京都大学で開発されたMeCab、日本のMatzが生み出したRubyを使うのが粋なんじゃないかなって思ってます。Ruby書きやすいしね。'

counts = Hash.new

natto = Natto::MeCab.new
natto.parse(txt) do |n|
  the_key = "#{n.surface}"
  if counts.has_key?(the_key)
    counts[the_key] = counts[the_key] + 1
  else
    counts[the_key] = 1
  end
end

sum = counts.values.inject(:+)

ordered_counts = counts.sort_by { |_, v| -v }.to_h

i = 1
display_num = 10 # 上位 display_num 件表示する

ordered_counts.each do |key, value|
  break if i > display_num
  rate = (value / sum.to_f * 100).floor(2)
  p "第#{i}位: 「#{key}」のキーワード比率は#{rate}%です"
  i = i + 1
end
