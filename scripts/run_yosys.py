import sys, os


if __name__ == "__main__":

  # STEP
  if len(sys.argv) <= 1:
    print("1 arguments needed!")
    print("Usage: " + sys.argv[0] + " src/yosys_file.ys")
    exit()
  yosys_file = sys.argv[1]


  # STEP
  command = "yosys -s %s" % yosys_file
  print("[command to run]: ", command)
  os.system(command)

