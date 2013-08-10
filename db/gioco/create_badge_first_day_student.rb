type = Type.find_or_create_by_name('student')
badge = Badge.create({ 
                      :name => 'first_day', 
                      :points => '100',
                      :type_id  => type.id,
                      :default => 'false'
                    })
puts '> Badge successfully created'