require "google_drive"

class Sheet

  def initialize
    @session = GoogleDrive::Session.from_service_account_key("creds.json")
    @spreadsheet = @session.spreadsheet_by_title("AlgorithmicComplexity") 
    @first_sheet = @spreadsheet.worksheets.first
    # clear_sheet
    setup_range
  end

  attr_reader :session, :spreadsheet, :first_sheet

  def add_to_sheet(values)
    values_range = Google::Apis::SheetsV4::ValueRange.new(values: values)
    result = @first_sheet.append(@spreadsheet.id, @range, values_range , value_input_option:'RAW')
    
  end

  private

  def clear_sheet

  end

  def setup_range
    @cols = [ ['Input','Time (seconds)']] 
    @range =  ['A1:B1']  
  end

end