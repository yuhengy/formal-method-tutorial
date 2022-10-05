import sys, os


if __name__ == "__main__":

  # STEP
  if len(sys.argv) <= 1:
    print("1 arguments needed!")
    print("Usage: " + sys.argv[0] + " top_verilog.v")
    exit()
  top_verilog = sys.argv[1]
  top_verilog_name = top_verilog[4:-2].replace("/", "-")


  # STEP
  command = "mkdir -p build"
  print("[command to run]: ", command)
  os.system(command)
  command = "rm -r build/%s" % top_verilog_name
  print("[command to run]: ", command)
  os.system(command)


  # STEP compile
  command = "echo \"\\`include \\\"%s\\\"\" > scripts/top.v" % top_verilog
  print("[command to run]: ", command)
  os.system(command)

  command = "verilator --cc --Mdir build/%s --trace --exe --build -j 4 %s %s" \
            % (top_verilog_name,
               os.path.join(os.getcwd(), "scripts/top.v"),
               os.path.join(os.getcwd(), "scripts/main.cpp"))
  print("[command to run]: ", command)
  os.system(command)
  
  command = "rm scripts/top.v"
  print("[command to run]: ", command)
  os.system(command)


  # STEP run
  command = "build/%s/Vtop %s" % (top_verilog_name, top_verilog_name)
  print("[command to run]: ", command)
  os.system(command)

