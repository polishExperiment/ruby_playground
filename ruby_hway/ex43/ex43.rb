class Scene
  def enter()
  end
end


class Engine

  def initialize(scene_map)
    puts "Engine initialized"
    puts scene_map.inspect
  end

  def play()
  end
end

class Death < Scene

  def enter()
  end
end

class CentralCorridor < Scene

  def enter()
  end
end

class LaserWeaponArmory < Scene

  def enter()
  end
end

class TheBridge < Scene

  def enter()
  end
end

class EscapePod < Scene

  def enter()
  end
end


class Map
  SCENE_PREFIX = "You entered %{scene_name}."
  SCENES = {:Death => "You died.", :CentralCorridor => "You entered central corridor", :LaserWeaponArmory => "You entered Laser Weapon Armory", :TheBridge => "You entered The Bridge", :EscapePod => "You entered Escape Pod"}

  def initialize( start_scene)
    puts SCENE_PREFIX % {scene_name: start_scene}
  end

  def next_scene( scene_name)
  end

  def opening_scene()
  end
end


a_map = Map.new(:'Central Corridor')
a_game = Engine.new(a_map)
a_game.play()








# * Map
#   - next_scene
#   - opening_scene
# * Engine
#   - play
# * Scene
#   - enter
#   * Death
#   * Central Corridor
#   * Laser Weapon Armory
#   * The Bridge
#   * Escape Pod
