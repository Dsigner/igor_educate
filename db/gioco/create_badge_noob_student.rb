type = Type.find_or_create_by_name('student')
badge = Badge.create({ 
                      :name => 'noob', 
                      :points => '0',
                      :type_id  => type.id,
                      :default => 'true'
                    })
resources = User.find(:all)
resources.each do |r|
        r.points  << Point.create({ :type_id => type.id, :value => '0'})
          r.badges << badge
          r.save!
        end
puts '> Badge successfully created'