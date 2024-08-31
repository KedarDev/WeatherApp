import { createTheme } from "@mui/material/styles";
import { createContext, useMemo, useState } from "react";

//color design tokens export
export const tokens = (mode) => ({
  ...(mode === "light"
    ? {
        white: {
          100: "#fefeff",
          200: "#fcfdff",
          300: "#fbfcff",
          400: "#f9fbff",
          500: "#f8faff", //background color
          600: "#c6c8cc",
          700: "#ecf2ff", //purple-ish
          800: "#636466",
          900: "#323233",
        },
        black: {
          100: "#ccd5de",
          200: "#99aabd",
          300: "#66809d",
          400: "#33557c",
          500: "#002b5b", // dark blue-ish
          600: "#002249",
          700: "#001a37",
          800: "#001124",
          900: "#000912",
        },
        primary: {
          100: "#ccd5de",
          200: "#99aabd",
          300: "#66809d",
          400: "#33557c",
          500: "#002b5b", // dark blue-ish
          600: "#002249",
          700: "#001a37",
          800: "#001124",
          900: "#000912",
        },
        neutral: {
          100: "#f8faff", //background color
          200: "#002b5b", // text color
          300: "#ECF2FF", // secondary color
        },
      }
    : {
        black: {
          100: "#d2d2d2",
          200: "#a5a5a5",
          300: "#797777",
          400: "#4c4a4a",
          500: "#1f1d1d", // bg dark
          600: "#191717",
          700: "#333333", //lighter shade
          800: "#0c0c0c",
          900: "#060606",
        },

        primary: {
          100: "#f8d7ef",
          200: "#f2afdf",
          300: "#eb88d0",
          400: "#e560c0",
          500: "#de38b0", // pink ish
          600: "#b22d8d",
          700: "#85226a",
          800: "#591646",
          900: "#2c0b23",
        },

        neutral: {
          100: "#1f1d1d", // bg dark
          200: "#ffffff", // text color
          300: "#333333", //secondary shade
        },

        white: {
          100: "#ffffff",
          200: "#ffffff",
          300: "#ffffff",
          400: "#ffffff",
          500: "#ffffff", //text color
          600: "#cccccc",
          700: "#999999",
          800: "#666666",
          900: "#333333",
        },
      }),
});

//mui theme settings
export const themeSettings = (mode) => {
  const colors = tokens(mode);
  return {
    palette: {
      mode: mode,
      ...(mode === "light"
        ? {
            primary: {
              main: colors.primary[500],
            },
            secondary: {
              main: colors.white[700],
            },
            neutral: {
              dark: colors.black[700],
              main: colors.black[500],
              light: colors.white[500],
              text: colors.primary[500],
            },
            background: {
              default: colors.neutral[100],
            },
          }
        : {
            primary: {
              main: colors.primary[500],
            },
            secondary: {
              main: colors.white[700],
            },
            neutral: {
              dark: colors.black[700],
              main: colors.black[500],
              light: colors.white[500],
              text: colors.white[500],
            },
            background: {
              default: colors.neutral[100],
            },
          }),
    },
    typography: {
      fontFamily: ["Poppins", "sans-serif"].join(","),
      fontSize: 12,
      h1: {
        fontFamily: ["Poppins", "sans-serif"].join(","),
        fontSize: 40,
      },
      h2: {
        fontFamily: ["Poppins", "sans-serif"].join(","),
        fontSize: 32,
      },
      h3: {
        fontFamily: ["Poppins", "sans-serif"].join(","),
        fontSize: 24,
      },
      h4: {
        fontFamily: ["Poppins", "sans-serif"].join(","),
        fontSize: 20,
      },
      h5: {
        fontFamily: ["Poppins", "sans-serif"].join(","),
        fontSize: 16,
      },
      h6: {
        fontFamily: ["Poppins", "sans-serif"].join(","),
        fontSize: 14,
      },
    },
    default: {
      main: colors.black[100],
      dark: colors.black[500],
    },
  };
};

// context for color mode
export const ColorModeContext = createContext({
  toggleColorMode: () => {},
});

export const useMode = () => {
  const [mode, setMode] = useState("light");

  const colorMode = useMemo(
    () => ({
      toggleColorMode: () =>
        setMode((prev) => (prev === "light" ? "dark" : "light")),
    }),
    []
  );

  const theme = useMemo(() => createTheme(themeSettings(mode)), [mode]);
  return [theme, colorMode];
};