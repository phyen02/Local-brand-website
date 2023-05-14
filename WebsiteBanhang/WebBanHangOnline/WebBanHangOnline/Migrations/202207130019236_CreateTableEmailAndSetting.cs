namespace WebBanHangOnline.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CreateTableEmailAndSetting : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.tb_Email",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Email = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.tb_SettingSystem",
                c => new
                    {
                        SettingKey = c.String(nullable: false, maxLength: 50),
                        SettingValue = c.String(),
                        SettingDesciption = c.String(maxLength: 500),
                    })
                .PrimaryKey(t => t.SettingKey);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.tb_SettingSystem");
            DropTable("dbo.tb_Email");
        }
    }
}
