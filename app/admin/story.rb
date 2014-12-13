ActiveAdmin.register Story do
  # Menu display index
  menu priority: 1

  # Batch Action
  config.batch_actions = true

  # Scopes
  scope :business_econ
  scope :gov_politics
  scope :sports
  scope :science
  scope :environment
  scope :arts_entertainment

  # Filters
  # config.filters = false
  filter :priority
  filter :pipeline
  filter :created_at
  filter :updated_at

 ############################################### 
 # Views
 ###############################################

 # Show
  show do |story|
    h1 story.subject
    div do 
      span {unless story.pipeline.blank? 
        status_tag(story.pipeline.pip_name) 
      end}
      span {unless story.priority.blank? 
        status_tag(story.priority.pri_name)
      end}
      span  {unless story.section.blank? 
        status_tag(story.section.sec_name)
      end}
    end

    table do
      columns do
        column id: "story_show" do
          div do 
            span "Headline:"
            span story.headline
          end
          div do
            span "Leadline:"
            span story.leadline
          end
          div do
            span "Shortline:"
            span story.shortline
          end
          div do
            span "Created:"
            span story.created_at
            span "(#{distance_of_time_in_words_to_now(story.created_at)})"
          end
          div do
            span "Updated:"
            span story.updated_at
            span "(#{distance_of_time_in_words_to_now(story.updated_at)})"
          end

          story.atom.each do |atom|
            div class: "chip" do
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
        end
        column id: "story_show" do
          div image_tag(story.mast_url)
          div image_tag(story.thumb_url)
        end
      end
    end
  end

  # Index
  index do |story|
      selectable_column
      column "thb" do |story| 
        image_tag(story.thumb_url, size: "40")
      end
      column "Pipeline", sortable: :pipeline do |story|
        unless story.pipeline.nil?
          status_tag(story.pipeline.pip_name)
        end
      end
      column "Priority", sortable: :priority do |story|
        unless story.priority.nil?
          status_tag(story.priority.pri_name)
        end
      end
      column "Subject", sortable: :subject do |story|
        link_to story.subject, admin_story_path(story)
      end
      column "Headline", sortable: :headline do |story|
        link_to story.headline, admin_story_path(story)
      end
      column "Section", sortable: :section do |story|
        unless story.section.nil? 
          story.section.sec_name 
        end
      end
      column "Updated", sortable: :updated_at do |story|
        distance_of_time_in_words_to_now(story.updated_at)
      end
      column "Age", sortable: :created_at do |story|
        distance_of_time_in_words_to_now(story.created_at)
      end
    end

  # Permited Parameters
  permit_params do
    permitted = [:subject, :headline, :leadline, :shortline, :mast_url, :thumb_url, :section_id, :priority_id, :pipeline_id]
  end

  # filter :section, as: :select, collection: proc { Section.all }

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