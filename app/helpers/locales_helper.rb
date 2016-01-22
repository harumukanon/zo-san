module LocalesHelper
  LOCALE_LABELS = {
    :en => "English",
    :"en-US" => "English (US)",
    :ja => "日本語",
    :zh => "中文",
    :"zh-TW" => "繁體中文"
  }

  def locale_label(locale)
    LOCALE_LABELS[locale] || "Unknown"
  end
  
  def error_count(count)
    case I18n.locale
    when :en
      pluralize(count, t('error_count'))
    else
      "#{count}#{t('error_count')}"
    end
  end
end