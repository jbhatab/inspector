theme = Theme.create(name: 'Test Theme', description: 'This is a test theme.')

sg_info = theme.setting_groups.build(name: 'Information')
sg_info.save
sg_info.settings.create([{name: 'Company Name'}, {name: 'Contact Email'}, {name: 'About Us'} ])

sg_links = theme.setting_groups.build(name: 'Links')
sg_links.save
sg_links.settings.create([{name: 'Main Link 1'}, {name: 'Main Link 2'}, {name: 'Contact'}, {name: 'About'} ])

