#define KEYS 67
static Key keys_hr[] = {
   { "`", "~",  XK_quoteleft, 1},
   { "1", "!", XK_1, 1 },
   { "2",  "\"", XK_2, 1 },
   { "3", "#", XK_3, 1 },
   { "4", "$", XK_4, 1 },
   { "5", "%", XK_5, 1 },
   { "6", "&", XK_6, 1 },
   { "7", "/", XK_7, 1 },
   { "8", "(", XK_8, 1 },
   { "9", ")", XK_9, 1 },
   { "0", "=", XK_0, 1 },
   { "'", "?", XK_apostrophe, 1 },
   { "+", "*", XK_plus, 1 },
   { "Del", 0, XK_Delete, 1},
   { "Bksp", 0, XK_BackSpace, 1 },
   { 0 },
   { "Tab", 0, XK_Tab, 1.5 },
   { "Q", 0, XK_q, 1 },
   { "W", "|", XK_w, 1 },
   { "E", 0, XK_e, 1 },
   { "R", 0, XK_r, 1 },
   { "T", 0, XK_t, 1 },
   { "Z", 0, XK_z, 1 },
   { "U", 0, XK_u, 1 },
   { "I", 0, XK_i, 1 },
   { "O", 0, XK_o, 1 },
   { "P", 0, XK_p, 1 },
   { "Š", 0, XK_scaron, 1 },
   { "Đ", 0, XK_dstroke, 1 },
   { "Enter", 0, XK_Return, 1.5 },
   { 0 },
   { "CapsLock", 0, XK_Caps_Lock, 2 },
   { "A", 0, XK_a, 1 },
   { "S", 0, XK_s, 1 },
   { "D", 0, XK_d, 1 },
   { "F", "[", XK_f, 1 },
   { "G", "]", XK_g, 1 },
   { "H", 0, XK_h, 1 },
   { "J", 0, XK_j, 1 },
   { "K", 0, XK_k, 1 },
   { "L", 0, XK_l, 1 },
   { "Č", 0, XK_ccaron, 1 },
   { "Ć", 0, XK_cacute, 1 },
   { "Ž", 0, XK_zcaron, 1 },
   { " ", 0, XK_Return, 1 },
   { 0 },
   { "Shift", 0, XK_Shift_L, 1.5 },
   { "<", ">", XK_less, 1 },
   { "Y", 0, XK_y, 1 },
   { "X", 0, XK_x, 1 },
   { "C", 0, XK_c, 1 },
   { "V", "@", XK_v, 1 },
   { "B", "{", XK_b, 1 },
   { "N", "}", XK_n, 1 },
   { "M", 0, XK_m, 1 },
   { ",", ";", XK_comma, 1 },
   { ".", ":", XK_period, 1 },
   { "-", "_", XK_minus, 1 },
   { "Shift", 0, XK_Shift_R, 2.5 },
   { 0 },
   { "Ctrl", 0, XK_Control_L, 1.5 },
   { "Win", 0, XK_Super_L, 1.5 },
   { "Alt", 0, XK_Alt_L, 1.5 },
   { "Space", 0, XK_space, 6 },
   { "Alt Gr", 0, XK_ISO_Level3_Shift, 1.5 },
   { "Menu", 0, XK_Menu, 1.5 },
   { "Ctrl", 0, XK_Control_R, 1.5 },
};

Buttonmod buttonmods[] = {
   { XK_Shift_L, Button2 },
   { XK_Alt_L, Button3 },
};

#define OVERLAYS 1
static Key overlay[OVERLAYS] = {
   { 0, 0, XK_Cancel },
};

#define LAYERS 1
static char* layer_names[LAYERS] = {
   "hr",
};

static Key* available_layers[LAYERS] = {
   keys_hr,
};
