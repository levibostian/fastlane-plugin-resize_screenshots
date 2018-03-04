require 'fastlane/action'
require 'mini_magick'
require_relative '../helper/resize_screenshots_helper'

module Fastlane
  module Actions
    class ResizeScreenshotsAction < Action
      def self.run(params)
        Dir.foreach(Dir.pwd) do |item|
          next if item == '.' or item == '..' or !item.include? "Simulator Screen Shot - "

          UI.message("Resizing screenshot: #{item} to size: #{get_device_dimensions(item)}.")

          image = MiniMagick::Image.open(item)
          image.resize get_device_dimensions(item)
          image.format "png"
          image.write item

          UI.message("Resizing of #{item} complete.")
        end

        UI.message("Resizing of images complete!")
      end

      def self.get_device_dimensions(filename)
        if filename.include? "iPhone X"
          return "1125x2436"
        elsif filename.include? "iPhone 6"
          return "750x1334"
        elsif filename.include? "iPhone 5"
          return "640x1136"
        elsif filename.include? "iPhone 6 Plus"
          return "1080x1920"
        else
          UI.error("Unknown device for file: #{filename}. Make sure to use iPhone 5, 6, 6 Plus, or X.")
        end
      end

      def self.description
        "Resize screenshots taken from your simulator to use for Frameit."
      end

      def self.authors
        ["Levi Bostian"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Take screenshots from your simulator, resize them to their appropriate size, then send the screenshots into Frameit to generate screenshots for the store!"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "RESIZE_SCREENSHOTS_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
