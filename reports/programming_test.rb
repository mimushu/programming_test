
def read_file(file)
  file_array = []
  File.open(file_name) do |file|
    file.each_line do |labmen|
      file_array << labmen.split.map(&:to_s)
    end
  end
  return file_array
end

def read_file_one_array(file_name)
  file_one_array = []
  File.open(file_name) do |file|
    file.each_line do |labmen|
       file_one_array << labmen.split
       file_one_array.flatten!
    end
  end
  return file_one_array
end

def post_slack(subscribe, renew, cancel, churnrate, pro_users)
  require 'slack/incoming/webhooks'

  slack = Slack::Incoming::Webhooks.new "https://hooks.slack.com/services/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"
  attachments = [{
    title: "Subscription-Report",
    title_link: "https://datadog.com/path/to/event",
    text: "本日のSubscribe数は#{subscribe}, Renew数は#{renew}, cancel数は#{cancel}です。\nなお、今月のChurn Rateは#{churnrate}%, PROユーザー数は#{pro_users}人です。\n今日もがんばっていきましょー！",
    color: "#FF4500"
    }]
  slack.post "", attachments: attachments
end

def calc_event_count(files)
  subscribe_count = 0
  renew_count = 0
  cancel_count = 0
  files.each do |i|
    subscribe_count += read_file_one_array(i).count("Subscribe")
    renew_count += read_file_one_array(i).count("Renew")
    cancel_count += read_file_one_array(i).count("Cancel")
  end
  # churnrate = sprintf("%.2f", (renew_count.to_f / (renew_count + cancel_count)))
  churnrate = cancel_count.to_f / (renew_count + cancel_count)
  p "#{subscribe_count}, #{churnrate}"
  pro_users = (subscribe_count / churnrate).to_i
  post_slack(subscribe_count, renew_count, cancel_count, sprintf("%.2f", (churnrate*100)), pro_users)
end

files = [ "Subscription_Event_86335385_20170212.txt",
          "Subscription_Event_86335385_20170213.txt",
          "Subscription_Event_86335385_20170214.txt",
          "Subscription_Event_86335385_20170215.txt",
          "Subscription_Event_86335385_20170216.txt",
          "Subscription_Event_86335385_20170217.txt",
          "Subscription_Event_86335385_20170218.txt",
          "Subscription_Event_86335385_20170219.txt",
          "Subscription_Event_86335385_20170220.txt",
          "Subscription_Event_86335385_20170221.txt",
          "Subscription_Event_86335385_20170222.txt",
          "Subscription_Event_86335385_20170223.txt",
          "Subscription_Event_86335385_20170224.txt",
          "Subscription_Event_86335385_20170225.txt",
          "Subscription_Event_86335385_20170226.txt",
          "Subscription_Event_86335385_20170227.txt",
          "Subscription_Event_86335385_20170228.txt",
          "Subscription_Event_86335385_20170301.txt",
          "Subscription_Event_86335385_20170302.txt",
          "Subscription_Event_86335385_20170303.txt",
          "Subscription_Event_86335385_20170304.txt",
          "Subscription_Event_86335385_20170305.txt",
          "Subscription_Event_86335385_20170306.txt",
          "Subscription_Event_86335385_20170307.txt",
          "Subscription_Event_86335385_20170308.txt",
          "Subscription_Event_86335385_20170309.txt",
          "Subscription_Event_86335385_20170310.txt",
          "Subscription_Event_86335385_20170311.txt",
          "Subscription_Event_86335385_20170312.txt",
          "Subscription_Event_86335385_20170313.txt",
          "Subscription_Event_86335385_20170314.txt",
          "Subscription_Event_86335385_20170315.txt",
          "Subscription_Event_86335385_20170316.txt",
          "Subscription_Event_86335385_20170317.txt",
          "Subscription_Event_86335385_20170318.txt",
          "Subscription_Event_86335385_20170319.txt",
          "Subscription_Event_86335385_20170320.txt",
          "Subscription_Event_86335385_20170321.txt",
          "Subscription_Event_86335385_20170322.txt",
          "Subscription_Event_86335385_20170323.txt",
          "Subscription_Event_86335385_20170324.txt",
          "Subscription_Event_86335385_20170325.txt"
        ]

        calc_event_count(files)
