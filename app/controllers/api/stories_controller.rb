module Api
  class StoriesController < Api::BaseController

    private

    def story_params
      params.require(:story).permit(:subject, :headline, :leadline, :shortline, :mast_url, :thumb_url, :section_id, :priority_id, :created_at, :updated_at)
    end

    def query_params
        # this assumes that an StoryContainer belongs to a Section, Priority,
        # and Pipeline and has an corresponding :xxx_id
        # allowing us to filter by this
        params.permit(:section, :priority, :pipeline)
      end

    end
  end