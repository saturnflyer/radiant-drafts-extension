namespace :radiant do
  namespace :extensions do
    namespace :drafty do
      
      desc "Runs the migrate and update tasks of the Drafts extension"
      task :install => [:environment, :migrate, :update]
      
      desc "Runs the migration of the Drafts extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          DraftsExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          DraftsExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Drafts to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[DraftsExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(DraftsExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
