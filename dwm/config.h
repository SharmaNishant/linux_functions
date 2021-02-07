/* See LICENSE file for copyright and license details. */

// clang-format off

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
    [SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "web", "code", "term", "personal", "other" };

static const Rule rules[] = {
    /* xprop(1):
     *    WM_CLASS(STRING) = instance, class
     *    WM_NAME(STRING) = title
     */
    /* class               instance    title       tags mask     isfloating   monitor */
    { "Google-chrome",     NULL,       NULL,       1,            0,           -1 },
//  { "Gnome-terminal",    NULL,       NULL,       1 | (1 << 1), 0,           -1 },
    { "Sublime_text",      NULL,       NULL,       1 << 1,       0,           -1 },
    { "Firefox",           NULL,       NULL,       1 << 3,       0,           -1 },
    { "Peek",              NULL,       NULL,       0,            1,           -1 },
    { "Steam",             NULL,       NULL,       1 << 4,       0,           -1 },
    { "csgo_linux64",      NULL,       NULL,       1 << 4,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",      tile },    /* first entry is default */
    { "><>",      NULL },    /* no layout function means floating behavior */
    { "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "gnome-terminal", NULL };
static const char *shutdowncmd[]  = { "shutdown", "-h", "now", NULL };
static const char *upvol[]   = { "/usr/bin/pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%",     NULL };
static const char *downvol[] = { "/usr/bin/pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%",     NULL };
static const char *mutevol[] = { "/usr/bin/pactl", "set-sink-mute",   "@DEFAULT_SINK@", "toggle",  NULL };
static const char *upbrightness[] = { "xbacklight",   "-inc",   "5", NULL };
static const char *downbrightness[] = { "xbacklight", "-dec",   "5", NULL };

// patches
#include "customizations.c"

static Key keys[] = {
    /* modifier                         key                function        argument */
    { MODKEY,                           XK_p,              spawn,          {.v = dmenucmd } },
    { Mod1Mask|ControlMask,             XK_t,              spawn,          {.v = termcmd } },
    { MODKEY,                           XK_b,              togglebar,      {0} },
    { MODKEY,                           XK_j,              focusstack,     {.i = +1 } },
    { MODKEY,                           XK_k,              focusstack,     {.i = -1 } },
    { MODKEY,                           XK_i,              incnmaster,     {.i = +1 } },
    { MODKEY,                           XK_d,              incnmaster,     {.i = -1 } },
    { MODKEY,                           XK_bracketleft,    setmfact,       {.f = -0.05} },
    { MODKEY,                           XK_bracketright,   setmfact,       {.f = +0.05} },
    {MODKEY | ShiftMask,                XK_bracketleft,    setcfact,       {.f = -0.25}},
    {MODKEY | ShiftMask,                XK_bracketright,   setcfact,       {.f = +0.25}},
    { MODKEY,                           XK_Return,         zoom,           {0} },
    { MODKEY,                           XK_Tab,            view,           {0} },
    { Mod1Mask,                         XK_Tab,            view,           {0} },
    { MODKEY|ShiftMask,                 XK_c,              killclient,     {0} },
    { MODKEY,                           XK_t,              setlayout,      {.v = &layouts[0]} },
    { MODKEY,                           XK_f,              setlayout,      {.v = &layouts[1]} },
    { MODKEY,                           XK_m,              setlayout,      {.v = &layouts[2]} },
    { MODKEY,                           XK_space,          setlayout,      {0} },
    { MODKEY|ShiftMask,                 XK_space,          togglefloating, {0} },
    { MODKEY,                           XK_0,              view,           {.ui = ~0 } },
    { MODKEY|ShiftMask,                 XK_0,              tag,            {.ui = ~0 } },
    { MODKEY,                           XK_comma,          focusmon,       {.i = -1 } },
    { MODKEY,                           XK_period,         focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask,                 XK_comma,          tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask,                 XK_period,         tagmon,         {.i = +1 } },
    TAGKEYS(                            XK_1,                              0)
    TAGKEYS(                            XK_2,                              1)
    TAGKEYS(                            XK_3,                              2)
    TAGKEYS(                            XK_4,                              3)
    TAGKEYS(                            XK_5,                              4)
    TAGKEYS(                            XK_6,                              5)
    TAGKEYS(                            XK_7,                              6)
    TAGKEYS(                            XK_8,                              7)
    TAGKEYS(                            XK_9,                              8)
    { MODKEY|ShiftMask,                 XK_q,              quit,           {0} },
    { Mod1Mask|ControlMask,             XK_l,              spawn,          SHCMD("xscreensaver-command --lock") },
    { MODKEY,                           XK_l,              spawn,          SHCMD("xscreensaver-command --lock") },
    { MODKEY|ShiftMask,                 XK_s,              spawn,          {.v = shutdowncmd } },
    { ControlMask|ShiftMask,            XK_Print,          spawn,          SHCMD("maim -s --noopengl | xclip -selection clipboard -t image/png") },
    { 0,                                XK_Print,          spawn,          SHCMD("gnome-screenshot") },
    {ControlMask,                       XK_Print,          spawn,          SHCMD("gnome-screenshot -a")},
    { MODKEY,                           XK_Up,             focusstack,     {.i = +1 }  },
    { MODKEY,                           XK_Down,           focusstack,     {.i = -1 }  },
    { MODKEY|ShiftMask,                 XK_Up,             shiftview,      {.i = -1 }  },
    { MODKEY|ShiftMask,                 XK_Down,           shiftview,      {.i = +1 }  },
    { MODKEY,                           XK_Left,           focusmon,       {.i = -1 }  },
    { MODKEY,                           XK_Right,          focusmon,       {.i = +1 }  },
    { MODKEY|ShiftMask,                 XK_Left,           tagmon,         {.i = -1 }  },
    { MODKEY|ShiftMask,                 XK_Right,          tagmon,         {.i = +1 }  },
    { MODKEY,                           XK_Prior,          shiftview,      {.i = -1 }  },
    { MODKEY,                           XK_Next,           shiftview,      {.i = +1 }  },
    { Mod1Mask|ControlMask,             XK_Down,           shiftview,      {.i = +1 }  },
    { Mod1Mask|ControlMask,             XK_Up,             shiftview,      {.i = -1 }  },
    { Mod1Mask|ControlMask|ShiftMask,   XK_Down,           shifttagview,   {.i = +1 }  },
    { Mod1Mask|ControlMask|ShiftMask,   XK_Up,             shifttagview,   {.i = -1 }  },
    { 0,                                0x1008ff11,        spawn,          {.v = downvol } },
    { 0,                                0x1008ff12,        spawn,          {.v = mutevol } },
    { 0,                                0x1008ff13,        spawn,          {.v = upvol   } },
    { 0,                                0x1008ff02,        spawn,          {.v = upbrightness   } },
    { 0,                                0x1008ff03,        spawn,          {.v = downbrightness } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click                event mask      button          function        argument */
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
    { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
    { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
    { ClkClientWin,         MODKEY,         Button4,        shiftview,      {.i = -1 } },
    { ClkClientWin,         MODKEY,         Button5,        shiftview,      {.i = +1 } },
    { ClkRootWin,           MODKEY,         Button4,        shiftview,      {.i = -1 } },
    { ClkRootWin,           MODKEY,         Button5,        shiftview,      {.i = +1 } },
    { ClkTagBar,            0,              Button4,        shiftview,      {.i = -1 } },
    { ClkTagBar,            0,              Button5,        shiftview,      {.i = +1 } },
};

