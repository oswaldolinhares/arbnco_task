object_types = ["WALL", "WINDOW", "ZONE", "HVAC-SYSTEM", "DHW-GENERATOR", "GLASS", "CONSTRUCTION", "COMPLIANCE", "GENERAL", "REC-USER", "UNIDENTIFIED"]

object_types.each do |type|
    ObjectType.create(name: type)
end
