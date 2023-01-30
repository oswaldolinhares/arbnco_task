json.array! @imports do |import|
    json.extract! import, :id, :filename, :user, :structure, :created_at
    json.partial! 'imports/import_index', import: import
  end
  