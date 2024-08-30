class FixBookmarksSchema < ActiveRecord::Migration[7.1]
  def change
    # Cambiar el nombre de las columnas
    rename_column :bookmarks, :movies_id, :movie_id
    rename_column :bookmarks, :lists_id, :list_id

    # Cambiar el tipo de la columna comment de string a text
    change_column :bookmarks, :comment, :text

    # Verificar y eliminar índices antiguos si existen
    remove_index :bookmarks, name: 'index_bookmarks_on_movies_id' if index_exists?(:bookmarks, :movies_id)
    remove_index :bookmarks, name: 'index_bookmarks_on_lists_id' if index_exists?(:bookmarks, :lists_id)

    # Verificar y crear nuevos índices si no existen
    add_index :bookmarks, :movie_id unless index_exists?(:bookmarks, :movie_id)
    add_index :bookmarks, :list_id unless index_exists?(:bookmarks, :list_id)
  end
end
