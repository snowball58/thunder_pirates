# Scotty's House Volunteer WebForm
# Written in 2016 by: 
# Gustavo Estrela
# Logan Ford
# Patrick Herrington
# Noemie Nakamura
# Steven Snow
# Matthew Wiecek
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
lass DateModifiedRef < ActiveRecord::Migration
  def up
    add_column :references, :date_modified, :datetime
  end
  def down
    remove_column :references, :date_modified, :datetime
  end
end
