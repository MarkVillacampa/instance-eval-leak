class LeakyViewController < UIViewController
  @@count = 0
  def viewWillAppear(animated)
    super
    @@count += 1
    if @id
      puts "The view already had a uuid! #{@id}"
    else
      @id = @@count
    end
    instance_eval {}
  end

  def viewDidAppear(animated)
    self.navigationController.popViewControllerAnimated(true)
  end
end

class MainViewController < UIViewController
  def viewDidAppear(animated)
    self.navigationController.pushViewController(LeakyViewController.alloc.init, animated:true)
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @mainViewController = MainViewController.alloc.init
    @navigationController = UINavigationController.alloc.initWithRootViewController(@mainViewController)
    @window.rootViewController = @navigationController
    @window.makeKeyAndVisible
    true
  end
end