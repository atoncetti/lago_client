defmodule LagoClient.InvoicePreviewInputCustomer do
  @moduledoc """
  Provides struct and type for a InvoicePreviewInputCustomer
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          address_line1: String.t() | nil,
          address_line2: String.t() | nil,
          city: String.t() | nil,
          country: String.t() | nil,
          currency: String.t() | nil,
          external_id: String.t() | nil,
          integration_customers:
            [LagoClient.InvoicePreviewInputCustomerIntegrationCustomers.t()] | nil,
          name: String.t() | nil,
          shipping_address: LagoClient.Address.t() | nil,
          state: String.t() | nil,
          tax_identification_number: String.t() | nil,
          timezone: String.t() | nil
        }

  defstruct [
    :__info__,
    :address_line1,
    :address_line2,
    :city,
    :country,
    :currency,
    :external_id,
    :integration_customers,
    :name,
    :shipping_address,
    :state,
    :tax_identification_number,
    :timezone
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      address_line1: {:string, :generic},
      address_line2: {:union, [{:string, :generic}, :null]},
      city: {:string, :generic},
      country:
        {:enum,
         [
           "AD",
           "AE",
           "AF",
           "AG",
           "AI",
           "AL",
           "AM",
           "AO",
           "AQ",
           "AR",
           "AS",
           "AT",
           "AU",
           "AW",
           "AX",
           "AZ",
           "BA",
           "BB",
           "BD",
           "BE",
           "BF",
           "BG",
           "BH",
           "BI",
           "BJ",
           "BL",
           "BM",
           "BN",
           "BO",
           "BQ",
           "BR",
           "BS",
           "BT",
           "BV",
           "BW",
           "BY",
           "BZ",
           "CA",
           "CC",
           "CD",
           "CF",
           "CG",
           "CH",
           "CI",
           "CK",
           "CL",
           "CM",
           "CN",
           "CO",
           "CR",
           "CU",
           "CV",
           "CW",
           "CX",
           "CY",
           "CZ",
           "DE",
           "DJ",
           "DK",
           "DM",
           "DO",
           "DZ",
           "EC",
           "EE",
           "EG",
           "EH",
           "ER",
           "ES",
           "ET",
           "FI",
           "FJ",
           "FK",
           "FM",
           "FO",
           "FR",
           "GA",
           "GB",
           "GD",
           "GE",
           "GF",
           "GG",
           "GH",
           "GI",
           "GL",
           "GM",
           "GN",
           "GP",
           "GQ",
           "GR",
           "GS",
           "GT",
           "GU",
           "GW",
           "GY",
           "HK",
           "HM",
           "HN",
           "HR",
           "HT",
           "HU",
           "ID",
           "IE",
           "IL",
           "IM",
           "IN",
           "IO",
           "IQ",
           "IR",
           "IS",
           "IT",
           "JE",
           "JM",
           "JO",
           "JP",
           "KE",
           "KG",
           "KH",
           "KI",
           "KM",
           "KN",
           "KP",
           "KR",
           "KW",
           "KY",
           "KZ",
           "LA",
           "LB",
           "LC",
           "LI",
           "LK",
           "LR",
           "LS",
           "LT",
           "LU",
           "LV",
           "LY",
           "MA",
           "MC",
           "MD",
           "ME",
           "MF",
           "MG",
           "MH",
           "MK",
           "ML",
           "MM",
           "MN",
           "MO",
           "MP",
           "MQ",
           "MR",
           "MS",
           "MT",
           "MU",
           "MV",
           "MW",
           "MX",
           "MY",
           "MZ",
           "NA",
           "NC",
           "NE",
           "NF",
           "NG",
           "NI",
           "NL",
           "NO",
           "NP",
           "NR",
           "NU",
           "NZ",
           "OM",
           "PA",
           "PE",
           "PF",
           "PG",
           "PH",
           "PK",
           "PL",
           "PM",
           "PN",
           "PR",
           "PS",
           "PT",
           "PW",
           "PY",
           "QA",
           "RE",
           "RO",
           "RS",
           "RU",
           "RW",
           "SA",
           "SB",
           "SC",
           "SD",
           "SE",
           "SG",
           "SH",
           "SI",
           "SJ",
           "SK",
           "SL",
           "SM",
           "SN",
           "SO",
           "SR",
           "SS",
           "ST",
           "SV",
           "SX",
           "SY",
           "SZ",
           "TC",
           "TD",
           "TF",
           "TG",
           "TH",
           "TJ",
           "TK",
           "TL",
           "TM",
           "TN",
           "TO",
           "TR",
           "TT",
           "TV",
           "TW",
           "TZ",
           "UA",
           "UG",
           "UM",
           "US",
           "UY",
           "UZ",
           "VA",
           "VC",
           "VE",
           "VG",
           "VI",
           "VN",
           "VU",
           "WF",
           "WS",
           "YE",
           "YT",
           "ZA",
           "ZM",
           "ZW"
         ]},
      currency:
        {:enum,
         [
           "AED",
           "AFN",
           "ALL",
           "AMD",
           "ANG",
           "AOA",
           "ARS",
           "AUD",
           "AWG",
           "AZN",
           "BAM",
           "BBD",
           "BDT",
           "BGN",
           "BIF",
           "BMD",
           "BND",
           "BOB",
           "BRL",
           "BSD",
           "BWP",
           "BYN",
           "BZD",
           "CAD",
           "CDF",
           "CHF",
           "CLF",
           "CLP",
           "CNY",
           "COP",
           "CRC",
           "CVE",
           "CZK",
           "DJF",
           "DKK",
           "DOP",
           "DZD",
           "EGP",
           "ETB",
           "EUR",
           "FJD",
           "FKP",
           "GBP",
           "GEL",
           "GIP",
           "GMD",
           "GNF",
           "GTQ",
           "GYD",
           "HKD",
           "HNL",
           "HRK",
           "HTG",
           "HUF",
           "IDR",
           "ILS",
           "INR",
           "ISK",
           "JMD",
           "JPY",
           "KES",
           "KGS",
           "KHR",
           "KMF",
           "KRW",
           "KYD",
           "KZT",
           "LAK",
           "LBP",
           "LKR",
           "LRD",
           "LSL",
           "MAD",
           "MDL",
           "MGA",
           "MKD",
           "MMK",
           "MNT",
           "MOP",
           "MRO",
           "MUR",
           "MVR",
           "MWK",
           "MXN",
           "MYR",
           "MZN",
           "NAD",
           "NGN",
           "NIO",
           "NOK",
           "NPR",
           "NZD",
           "PAB",
           "PEN",
           "PGK",
           "PHP",
           "PKR",
           "PLN",
           "PYG",
           "QAR",
           "RON",
           "RSD",
           "RUB",
           "RWF",
           "SAR",
           "SBD",
           "SCR",
           "SEK",
           "SGD",
           "SHP",
           "SLL",
           "SOS",
           "SRD",
           "STD",
           "SZL",
           "THB",
           "TJS",
           "TOP",
           "TRY",
           "TTD",
           "TWD",
           "TZS",
           "UAH",
           "UGX",
           "USD",
           "UYU",
           "UZS",
           "VND",
           "VUV",
           "WST",
           "XAF",
           "XCD",
           "XOF",
           "XPF",
           "YER",
           "ZAR",
           "ZMW"
         ]},
      external_id: {:string, :generic},
      integration_customers: [{LagoClient.InvoicePreviewInputCustomerIntegrationCustomers, :t}],
      name: {:string, :generic},
      shipping_address: {LagoClient.Address, :t},
      state: {:string, :generic},
      tax_identification_number: {:string, :generic},
      timezone:
        {:enum,
         [
           "UTC",
           "Africa/Algiers",
           "Africa/Cairo",
           "Africa/Casablanca",
           "Africa/Harare",
           "Africa/Johannesburg",
           "Africa/Monrovia",
           "Africa/Nairobi",
           "America/Argentina/Buenos_Aires",
           "America/Bogota",
           "America/Caracas",
           "America/Chicago",
           "America/Chihuahua",
           "America/Denver",
           "America/Godthab",
           "America/Guatemala",
           "America/Guyana",
           "America/Halifax",
           "America/Indiana/Indianapolis",
           "America/Juneau",
           "America/La_Paz",
           "America/Lima",
           "America/Los_Angeles",
           "America/Mazatlan",
           "America/Mexico_City",
           "America/Monterrey",
           "America/Montevideo",
           "America/New_York",
           "America/Phoenix",
           "America/Puerto_Rico",
           "America/Regina",
           "America/Santiago",
           "America/Sao_Paulo",
           "America/St_Johns",
           "America/Tijuana",
           "Asia/Almaty",
           "Asia/Baghdad",
           "Asia/Baku",
           "Asia/Bangkok",
           "Asia/Chongqing",
           "Asia/Colombo",
           "Asia/Dhaka",
           "Asia/Hong_Kong",
           "Asia/Irkutsk",
           "Asia/Jakarta",
           "Asia/Jerusalem",
           "Asia/Kabul",
           "Asia/Kamchatka",
           "Asia/Karachi",
           "Asia/Kathmandu",
           "Asia/Kolkata",
           "Asia/Krasnoyarsk",
           "Asia/Kuala_Lumpur",
           "Asia/Kuwait",
           "Asia/Magadan",
           "Asia/Muscat",
           "Asia/Novosibirsk",
           "Asia/Rangoon",
           "Asia/Riyadh",
           "Asia/Seoul",
           "Asia/Shanghai",
           "Asia/Singapore",
           "Asia/Srednekolymsk",
           "Asia/Taipei",
           "Asia/Tashkent",
           "Asia/Tbilisi",
           "Asia/Tehran",
           "Asia/Tokyo",
           "Asia/Ulaanbaatar",
           "Asia/Urumqi",
           "Asia/Vladivostok",
           "Asia/Yakutsk",
           "Asia/Yekaterinburg",
           "Asia/Yerevan",
           "Atlantic/Azores",
           "Atlantic/Cape_Verde",
           "Atlantic/South_Georgia",
           "Australia/Adelaide",
           "Australia/Brisbane",
           "Australia/Darwin",
           "Australia/Hobart",
           "Australia/Melbourne",
           "Australia/Perth",
           "Australia/Sydney",
           "Europe/Amsterdam",
           "Europe/Athens",
           "Europe/Belgrade",
           "Europe/Berlin",
           "Europe/Bratislava",
           "Europe/Brussels",
           "Europe/Bucharest",
           "Europe/Budapest",
           "Europe/Copenhagen",
           "Europe/Dublin",
           "Europe/Helsinki",
           "Europe/Istanbul",
           "Europe/Kaliningrad",
           "Europe/Kiev",
           "Europe/Lisbon",
           "Europe/Ljubljana",
           "Europe/London",
           "Europe/Madrid",
           "Europe/Minsk",
           "Europe/Moscow",
           "Europe/Paris",
           "Europe/Prague",
           "Europe/Riga",
           "Europe/Rome",
           "Europe/Samara",
           "Europe/Sarajevo",
           "Europe/Skopje",
           "Europe/Sofia",
           "Europe/Stockholm",
           "Europe/Tallinn",
           "Europe/Vienna",
           "Europe/Vilnius",
           "Europe/Volgograd",
           "Europe/Warsaw",
           "Europe/Zagreb",
           "Europe/Zurich",
           "GMT+12",
           "Pacific/Apia",
           "Pacific/Auckland",
           "Pacific/Chatham",
           "Pacific/Fakaofo",
           "Pacific/Fiji",
           "Pacific/Guadalcanal",
           "Pacific/Guam",
           "Pacific/Honolulu",
           "Pacific/Majuro",
           "Pacific/Midway",
           "Pacific/Noumea",
           "Pacific/Pago_Pago",
           "Pacific/Port_Moresby",
           "Pacific/Tongatapu"
         ]}
    ]
  end
end
