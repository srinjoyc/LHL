class RobotDeadException < StandardError
  def initialize (msg='Robot is dead')
   super
  end
end

class NotAttackableException < StandardError
  def initialize (msg="This unit cannot be attacked by the current unit")
    super
  end
end
