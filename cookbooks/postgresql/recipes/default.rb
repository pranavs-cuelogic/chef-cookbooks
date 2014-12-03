begin
execute "postgres repo" do

#  r = `rpm -qa | grep postgresql`
 # puts "-----------------#{r.inspect} #{r.class}"
 # if r.blank?
begin
    command "sudo rpm -Uvh http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm || true"
rescue => e
  puts "haha cauught #{e.class}"
end
#  end
end

rescue => ee
 puts "-------in other rescue #{ee.class}"
end


execute "postgres install" do

 command "sudo yum install -y postgresql93-server postgresql93"

end



execute "postgres deb init" do

 command "/etc/init.d/postgresql-9.3 initdb"

end



execute "postgres start" do

 command "sudo service postgresql-9.3 start"

end



execute "postgres startup on" do

 command "sudo chkconfig postgresql-9.3 on"

end
