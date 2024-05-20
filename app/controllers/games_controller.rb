class GamesController < ApplicationController
  def new
    o =  [('A'..'Z')].map{|i| i.to_a}.flatten
    @letterArray =  (0...10).map{ o[rand(o.length)]  }
  end

  def score
    @userWord = (params[:word].upcase).chars.sort()
    @letterList = (params[:letterList].chars).collect(&:strip).reject(&:empty?).sort()
    @i = 0
    @include = true

    while !@userWord.empty? || @include == true
      if @letterList.include?(@userWord[0])
        @userWord.delete(@userWord[0])
        @letterList.delete(@userWord[0])
        @i += 1
      else
        @response = false
        @include = false
      end
    end
  end
end
