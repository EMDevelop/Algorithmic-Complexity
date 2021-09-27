require "google_drive"
require 'google/apis/sheets_v4'
require 'googleauth'
# https://www.rubydoc.info/gems/google_drive/2.1.1/GoogleDrive/Worksheet

class Sheet

  def initialize
    @session = GoogleDrive::Session.from_service_account_key("creds.json")
    @spreadsheet = @session.spreadsheet_by_title("AlgorithmicComplexity") 
    @first_sheet = @spreadsheet.worksheets.first
    @second_sheet = @spreadsheet.worksheets[1]
    @third_sheet = @spreadsheet.worksheets[1]
    @service = Google::Apis::SheetsV4::SheetsService.new
    @cols = [ ['Input','First (seconds)', 'Second (seconds)', 'Third (seconds)']] 
  end

  attr_reader :session, :spreadsheet, :first_sheet, :service

  def add_to_sheet(values)
    clear
    vals = values.each { |array|
      @cols << array
    }
    p vals
    @first_sheet.insert_rows(1, @cols)
    @first_sheet.save
  end

  def find_row_num
    @first_sheet.rows.length
  end

  def clear 
    @first_sheet.delete_rows(1, find_row_num)
  end

end