  yield("/e --- Clear ---")

  file_path = os.getenv("appdata").."\\XIVLauncher\\pluginConfigs\\SomethingNeedDoing\\Example.lua"
  doodies = {}  -- Initialize an empty table
  if dutyFile ~= "buttcheeks" then
    yield("/echo Attempting to load -> "..file_path)
    file = io.open(file_path, "r")  -- Open the file in read mode
    if file then
      for line in file:lines() do  -- Iterate over each line in the file
        if line ~= "" then  -- Skip empty lines
          local row = {}  -- Initialize an empty table for each row
          for value in line:gmatch("[^,]+") do  -- Split the line by comma
            table.insert(row, value)  -- Insert each value into the row table
            --yield("/echo value "..value)
          end
        table.insert(doodies, row)  -- Insert the row into the main table
        end
      end
    file:close()  -- Close the file
    end
  end
  
yield("/e Doodies table = "..doodies[1])