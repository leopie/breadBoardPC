const char ADDR[] = {53, 51, 49, 47, 45, 43, 41, 39, 37, 35, 33, 31, 29, 27, 25, 23};
const char DATA[] = {52, 50, 48, 46, 44, 42, 40, 38};
const char D_PORTA[] = {36,34,32,30,28,26,24,22};
const char D_PORTB[] = {6,5,4};

#define CLOCK 2
#define READ_WRITE 3

void setup() {
  for(int i=0; i<16; i++) {
    pinMode(ADDR[i], INPUT);
  }
  for(int i=0; i<8; i++) {
    pinMode(DATA[i], INPUT);
  }
  for(int i=0; i<8; i++) {
    pinMode(D_PORTA[i], INPUT);
  }
  for(int i=0; i<3; i++) {
    pinMode(D_PORTB[i], INPUT);
  }
  pinMode(CLOCK, INPUT);
  pinMode(READ_WRITE, INPUT);

  attachInterrupt(digitalPinToInterrupt(CLOCK), onClock, RISING);

  Serial.begin(57600);
}

void onClock() {
  char output[15];

  unsigned int address = 0;
  for(int i=0; i<16; i++) { 
    int bit = digitalRead(ADDR[i]) ? 1 : 0;
    address = (address << 1 ) + bit;
    Serial.print(bit);
  }
  Serial.print("  -  ");
  unsigned int data = 0;
  for(int i=0; i<8; i++) { 
    int bit = digitalRead(DATA[i]) ? 1 : 0;
    data = (data << 1 ) + bit;
    Serial.print(bit);
  }
  Serial.print("  -  ");
  unsigned int d_portb = 0;
  for(int i=0; i<3; i++) { 
    int bit = digitalRead(D_PORTB[i]) ? 1 : 0;
    d_portb = (d_portb << 1 ) + bit;
    Serial.print(bit);
  }
  Serial.print("  -  ");
  unsigned int d_porta = 0;
  for(int i=0; i<8; i++) { 
    int bit = digitalRead(D_PORTA[i]) ? 1 : 0;
    d_porta = (d_porta << 1 ) + bit;
    Serial.print(bit);
  }

  sprintf(output, "  %04x %c %02x ", address, digitalRead(READ_WRITE) ? 'r':'W', data);

  Serial.println(output);
}

void loop() {
}