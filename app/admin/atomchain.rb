ActiveAdmin.register Atomchain do

  # Menu display index
  menu priority: 3

  # Form
  form do |f|
    f.inputs "Stories associating atoms" do
      f.input :story_id, as: :select, collection: Story.all.map { |s| [ s.id.to_s + " - " +  s.subject.truncate(60), s.id ] }, input_html: { size: 10 }, prompt: "Select story to add atoms to."
      f.input :atom_id, as: :select, collection: Atom.all.map { |a| [ a.id.to_s + " - " +  a.content.truncate(60) , a.id ] }, input_html: { size: 20 }, prompt: "Select atoms to add to story."
      f.actions
    end
  end

index do |atomchain|
  selectable_column
  column "Story Subject"  do |atomchain|
    atomchain.story.title
  end
  column "Story ID", sortable: :story_id do |atomchain|
    atomchain.story_id
  end
  column "Atom ID", sortable: :atom_id do |atomchain|
    atomchain.atom_id
  end
  column "Visible to Public" do |atomchain|
    status_tag atomchain.active
  end
  actions
end


permit_params do
  permitted = [:story_id, :atom_id]
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
