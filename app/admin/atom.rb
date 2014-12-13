ActiveAdmin.register Atom do
  config.paginate = false

  # Menu display index
  menu priority: 2

  # Scope 

  # Filters
  filter :taggings_tag_name, :as => :select, :collection => proc { Atom.tag_counts.map{|g| g.name} }
  filter :created_at
  filter :updated_at


  form do |f|
    f.inputs do
      f.input :tag_list
      f.inputs
      f.actions
    end
  end

  # Pages
  show do |atom|
    div for: atom, class: "chip" do
      if !atom.quote.blank? 
        div class: "quote" do atom.quote end
        span class: "attribution" do "#{atom.quoted_name} #{atom.quoted_title} #{atom.quoted_org}" end
      elsif !atom.img_url.blank?
        div image_tag img_url
      end

      div class: "content" do atom.content end

      span class: "last_updated" do
       "Updated: #{distance_of_time_in_words_to_now(atom.updated_at)}"
      end
      span class: "age" do
       "Age: #{distance_of_time_in_words_to_now(atom.created_at)}"
      end
      
      atom.tag_list.map {|tag| span class: "tag" do tag end}
    end
  end

  index as: :block do |atom|
    div for: atom, class: "chip" do
      resource_selection_cell atom

      span link_to "Edit # #{atom.id} ", edit_admin_atom_path(atom)
      span link_to "View # #{atom.id}", admin_atom_path(atom)

      if !atom.quote.blank? 
        div class: "quote" do atom.quote end
        span class: "attribution" do "#{atom.quoted_name} #{atom.quoted_title} #{atom.quoted_org}" end
      elsif !atom.img_url.blank?
        div image_tag img_url
      end

      div class: "content" do atom.content end

      span class: "last_updated" do
       "Updated: #{distance_of_time_in_words_to_now(atom.updated_at)}"
      end
      span class: "age" do
       "Age: #{distance_of_time_in_words_to_now(atom.created_at)}"
      end

      atom.tag_list.map {|tag| span class: "tag" do tag end}
    end
  end

  # Batch Action

  # Permited Parameters
  permit_params do
    permitted = [:content, :quote, :quoted_name, :quoted_title, :quoted_org, :img_url, :img_caption, :img_citation, :img_location, :tag_list, :story_ids]
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
end