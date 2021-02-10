int adventurerId(int group, int sequence, int sub) {
  int val = group;
  val = val << 10 | sequence;
  val = val << 4 | sub;
  return val;
}

bool isNullOrEmpty(String value) => value == null || value.isEmpty;
bool isNullOrZero(int value) => value == null || value == 0;

// flags
bool hasAllFlag(int value, int flag) => value & flag == flag;
bool hasAnyFlag(int value, int flag) => value & flag != 0;
int setFlag(int value, int flag) => value | flag;
int resetFlag(int value, int flag) => value & ~flag;
int switchFlag(int value, int flag) => value ^ flag;
