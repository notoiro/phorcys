use anyhow::{bail, ensure, Result};
use phorcys_osc::prelude::*;

/// Represents a set of information for a DateTime part.
#[derive(Debug, Clone, PartialEq, PartialOrd)]
pub struct DateTimePart {
    /// Target OSC Address.
    pub target_address: OscAddress,

    /// `ValueFormat` for sending data.
    pub format: ValueFormat,
}

/// Represents an expression format for time values.
#[derive(Debug, Clone, PartialEq, PartialOrd)]
pub enum ValueFormat {
    /// Abosolute integer expression.
    /// The value is in [0, X) in integer.
    Absolute(u8),

    /// Relative float expression.
    /// The value is in [0, X) (X <= 1).
    Relative(f32),
}

impl DateTimePart {
    /// Parses from comma-separated string.
    pub fn parse(s: &str) -> Result<DateTimePart> {
        let parts: Vec<_> = s.split(',').collect();
        ensure!(
            parts.len() == 3,
            "Invalid part format; it should be like /path/to/part,abs,60"
        );

        let target_address = OscAddress::new(parts[0])?;
        let format = match parts[1] {
            "abs" => ValueFormat::Absolute(parts[2].parse()?),
            "rel" => ValueFormat::Relative(parts[2].parse()?),
            _ => bail!(r#"Invalid sending format type; it should be "abs" or "rel""#),
        };

        Ok(DateTimePart {
            target_address,
            format,
        })
    }
}
