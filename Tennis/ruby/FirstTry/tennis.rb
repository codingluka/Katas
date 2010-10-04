class Tennis
  def initialize
    @wins_player1 = 0
    @wins_player2 = 0
    @score = {
      :love => 0,
      :fifteen => 1,
      :thirty => 2,
      :forty => 3
    }
  end
  
  def one args
    method = "one_player_has"
    self.send method.to_sym, args[:score]
  end
  
  def both args
    method = "both_players_has"
    self.send method.to_sym, args[:score]
  end
  
  def player args
    { :score => args[:score] }
  end
  
  def players args
    { :score => args[:score] }
  end
  
  def has n
    { :score => n }
  end
  
  def leading args
    method = "leading_player_leads_by"
    self.send method.to_sym, args[:score]
  end
  
  def leads args
    { :score => args[:score] }
  end
  
  def by n
    { :score => n }
  end
  
  def score
    return "deuce" if both players has :forty and score_is_equal
    return "advantage " + leading_player if both players has :forty and leading player leads by 1
    return leading_player + " wins" if one_player_has_more_than :forty and one player has :love
    return leading_player + " wins" if both players has :forty and leading player leads by 2
    return "#{print @wins_player1} - #{print @wins_player2}" 
  end
  
  def both_players_has score
    @wins_player1 >= @score[score] and @wins_player2 >= @score[score]
  end
  
  def score_is_equal 
    @wins_player1 == @wins_player2
  end
  
  def leading_player
    return "Player 1" if @wins_player1 > @wins_player2
    return "Player 2"
  end

  def leading_player_leads_by balls
    @wins_player1 == @wins_player2 + balls or @wins_player2 == @wins_player1 + balls
  end
  
  def one_player_has score
    @wins_player1 >= @score[score] or @wins_player2 >= @score[score]
  end
  
  def one_player_has_more_than balls
    @wins_player1 > @score[balls] or @wins_player2 > @score[balls]
  end
  
  def print balls_won
    if balls_won == 1 then return "fifteen" end
    if balls_won == 2 then return "thirty" end
    if balls_won == 3 then return "forty" end
    
    return "love"
  end
  
  def player1_wins balls
    @wins_player1 += balls
  end
  
  def player2_wins balls
    @wins_player2 += balls
  end
end