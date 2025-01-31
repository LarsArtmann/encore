#Menu: #RootMenu | #SubMenu

#RootMenu: {
	kind: "rootmenu"
	items: [...#MenuItem]
}

#SubMenu: {
	kind: "submenu"
	// Menu title to display when this submenu is active.
	title: string

	// Additional presentation options for the menu item.
	presentation?: #Presentation

	back: {
		// Text to display in the back button.
		text: string

		// Path to the page to navigate to when the back button is clicked.
		path: string
	}

	items: [...#MenuItem]
}

// Represents an item in a menu.
#MenuItem: #SectionMenuItem | #BasicMenuItem | #NavMenuItem | #AccordionMenuItem

#SectionMenuItem: {
	// Represents a menu section that can't be navigated to.
	kind: "section"

	// The text to display in the menu.
	text: string

	// Menu items to show for this section.
	items: [...#MenuItem]
}

#BasicMenuItem: {
	// Represents a basic page that can be navigated to.
	kind: "basic"

	// The text to display in the menu.
	text: string

	// The URL path to the page.
	path: string

	// The file to render when viewing this page.
	file: string

	// Inline menu to show when viewing this page.
	inline_menu?: [...#MenuItem]

	// hidden, if true, indicates the page exists but is hidden in the menu.
	// It can be navigated to directly, and will be show as "next page"/"prev page"
	// in the per-page navigation.
	hidden?: true
}

#NavMenuItem: {
	// Represents a page that can be navigated to, that has a menu
	// that replaces the navigation when viewing this page.
	kind: "nav"

	// The text to display in the menu.
	text: string

	// The URL path to the page.
	path: string

	// The file to render when viewing this page.
	file: string

	// The items to display in the submenu.
	submenu: #SubMenu

	// Additional presentation options for the menu item.
	presentation?: #Presentation
}

#Presentation: {
	// Icon to display next to the menu item.
	icon?: string
	style: "card" | *"basic"
}

#AccordionMenuItem: {
	kind: "accordion"
	text: string
	// If the accordion is open by default.
	defaultExpanded: bool | *false

	// The items to display in the accordion.
	accordion: [...#MenuItem]
}

// The root object is a #RootMenu.
#RootMenu
{
	items: [
		#IntroSection,
		#TutorialsSection,
		#DevelopmentSection,
		#ObservabilitySection,
		#PlatformSection,
		#SelfHostSection,
		#ResourcesSection,
		#CommunitySection,
		#OtherSection,
	]
}

#IntroSection: #SectionMenuItem & {
	kind: "section"
	text: "Introduction"
	items: [{
		kind: "basic"
		text: "Welcome"
		path: "/"
		file: "index"
	}, {
		kind: "basic"
		text: "What is Encore?"
		path: "/introduction"
		file: "introduction"
	}, {
		kind: "basic"
		text: "FAQ"
		path: "/faq"
		file: "faq"
	}, {
		kind: "basic"
		text: "Installation"
		path: "/install"
		file: "install"
	}, {
		kind: "basic"
		text: "Quick Start"
		path: "/quick-start"
		file: "quick-start"
	}]
}

#TutorialsSection: #SectionMenuItem & {
	kind: "section"
	text: "Tutorials"
	items: [{
		kind: "basic"
		text: "Overview"
		path: "/tutorials"
		file: "tutorials/index"
	}, {
		kind: "basic"
		text: "Building an Uptime Monitor"
		path: "/tutorials/uptime"
		file: "tutorials/uptime"
	}, {
		kind: "basic"
		text: "Building a REST API"
		path: "/tutorials/rest-api"
		file: "tutorials/rest-api"
	}, {
		kind: "basic"
		text: "Building a GraphQL API"
		path: "/tutorials/graphql"
		file: "tutorials/graphql"
	}, {
		kind: "basic"
		text: "Building a Slack bot"
		path: "/tutorials/slack-bot"
		file: "tutorials/slack-bot"
	}, {
		kind: "basic"
		text: "Building a Meeting Notes app"
		path: "/tutorials/meeting-notes"
		file: "tutorials/meeting-notes"
	}, {
		kind: "basic"
		text: "Building a Booking System"
		path: "/tutorials/booking-system"
		file: "tutorials/booking-system"
	}, {
		kind:   "basic"
		text:   "Building an Incident Management tool"
		path:   "/tutorials/incident-management-tool"
		file:   "tutorials/incident-management-tool"
		hidden: true
	}]
}

#EncoreGO: #SubMenu & {
	title: "Encore.go"
	presentation: {
		icon: "golang"
	}
	back: {
		text: "Back to Main Menu"
		path: "/docs"
	}
	items: [{
		kind: "section"
		text: "Concepts"
		items: [{
			kind: "basic"
			text: "App Structure"
			path: "/develop/app-structure"
			file: "develop/app-structure"
		}]
	}, {
		kind: "section"
		text: "Primitives"
		items: [{
			kind: "basic"
			text: "Services"
			path: "/primitives/services"
			file: "primitives/services"
		}, {
			kind: "accordion"
			text: "APIs"
			accordion: [{
				kind: "basic"
				text: "Defining APIs"
				path: "/primitives/apis"
				file: "primitives/apis"
			}, {
				kind: "basic"
				text: "API Calls"
				path: "/primitives/api-calls"
				file: "primitives/api-calls"
			}, {
				kind: "basic"
				text: "Raw Endpoints"
				path: "/primitives/raw-endpoints"
				file: "primitives/raw-endpoints"
			}, {
				kind: "basic"
				text: "Service Structs"
				path: "/primitives/services-and-apis/service-structs"
				file: "primitives/service-structs"
			}, {
				kind: "basic"
				text: "API Errors"
				path: "/develop/errors"
				file: "develop/errors"
			}]
		}, {
			kind: "accordion"
			text: "Databases"
			accordion: [{
				kind: "basic"
				text: "Using SQL databases"
				path: "/primitives/databases"
				file: "primitives/databases"
			}, {
				kind: "basic"
				text: "Change SQL database schema"
				path: "/how-to/change-db-schema"
				file: "how-to/change-db-schema"
			}, {
				kind: "basic"
				text: "Integrate with existing databases"
				path: "/how-to/connect-existing-db"
				file: "how-to/connect-existing-db"
			}, {
				kind: "basic"
				text: "Insert test data in a database"
				path: "/how-to/insert-test-data-db"
				file: "how-to/insert-test-data-db"
			}, {
				kind: "basic"
				text: "Share databases between services"
				path: "/how-to/share-db-between-services"
				file: "how-to/share-db-between-services"
			}, {
				kind: "basic"
				text: "Managing database user credentials"
				path: "/how-to/manage-db-users"
				file: "how-to/manage-db-users"
			}, {
				kind: "basic"
				text: "PostgreSQL Extensions"
				path: "/primitives/databases/extensions"
				file: "primitives/database-extensions"
			}, {
				kind: "basic"
				text: "Troubleshooting"
				path: "/primitives/databases/troubleshooting"
				file: "primitives/database-troubleshooting"
			}]
		}, {
			kind: "basic"
			text: "Cron Jobs"
			path: "/primitives/cron-jobs"
			file: "primitives/cron-jobs"
		}, {
			kind: "basic"
			text: "Pub/Sub"
			path: "/primitives/pubsub"
			file: "primitives/pubsub"
		}, {
			kind: "basic"
			text: "Caching"
			path: "/primitives/caching"
			file: "primitives/caching"
		}, {
			kind: "basic"
			text: "Secrets"
			path: "/primitives/secrets"
			file: "primitives/secrets"
		}, {
			kind: "basic"
			text: "Code Snippets"
			path: "/primitives/code-snippets"
			file: "primitives/code-snippets"
		}]
	}, {
		kind: "section"
		text: "Development"
		items: [{
			kind: "basic"
			text: "Authentication"
			path: "/develop/auth"
			file: "develop/auth"
		}, {
			kind: "basic"
			text: "Configuration"
			path: "/develop/config"
			file: "develop/config"
		}, {
			kind: "basic"
			text: "CORS"
			path: "/develop/cors"
			file: "develop/cors"
		}, {
			kind: "basic"
			text: "Metadata"
			path: "/develop/metadata"
			file: "develop/metadata"
		}, {
			kind: "basic"
			text: "Middleware"
			path: "/develop/middleware"
			file: "develop/middleware"
		}, {
			kind: "basic"
			text: "Testing"
			path: "/develop/testing"
			file: "develop/testing"
		}, {
			kind: "basic"
			text: "Mocking"
			path: "/develop/testing/mocking"
			file: "develop/mocking"
		}, {
			kind: "basic"
			text: "Validation"
			path: "/develop/validation"
			file: "develop/validation"
		}, {
			kind: "basic"
			text: "Logging"
			path: "/observability/logging"
			file: "observability/logging"
		}]
	}, {
		kind: "section"
		text: "How to guides"
		items: [{
			kind: "basic"
			text: "Build with cgo"
			path: "/how-to/cgo"
			file: "how-to/cgo"
		}, {
			kind: "basic"
			text: "Debug with Delve"
			path: "/how-to/debug"
			file: "how-to/debug"
		}, {
			kind: "basic"
			text: "Receive regular HTTP requests & Use websockets"
			path: "/how-to/http-requests"
			file: "how-to/http-requests"
		}, {
			kind: "basic"
			text: "Use Atlas + GORM for database migrations"
			path: "/how-to/atlas-gorm"
			file: "how-to/atlas-gorm"
		}, {
			kind: "basic"
			text: "Use the ent ORM for migrations"
			path: "/how-to/entgo-orm"
			file: "how-to/entgo-orm"
		}, {
			kind: "basic"
			text: "Use Connect for gRPC communication"
			path: "/how-to/grpc-connect"
			file: "how-to/grpc-connect"
		}, {
			kind: "basic"
			text: "Use a Pub/Sub Transactional Outbox"
			path: "/primitives/pubsub-outbox"
			file: "primitives/pubsub-outbox"
		}, {
			kind: "basic"
			text: "Use Dependency Injection"
			path: "/how-to/dependency-injection"
			file: "how-to/dependency-injection"
		}, {
			kind: "basic"
			text: "Use Auth0 Authentication"
			path: "/how-to/auth0-auth"
			file: "how-to/auth0-auth"
		}, {
			kind: "basic"
			text: "Use Clerk Authentication"
			path: "/how-to/clerk-auth"
			file: "how-to/clerk-auth"
		}, {
			kind: "basic"
			text: "Use Firebase Authentication"
			path: "/how-to/firebase-auth"
			file: "how-to/firebase-auth"
		}]
	}]
}

#EncoreTS: #SubMenu & {
	title: "Encore.ts"
	presentation: {
		icon: "typescript"
	}
	back: {
		text: "Back to Main Menu"
		path: "/docs"
	}
	items: [{
		kind: "section"
		text: "Concepts"
		items: [{
			kind: "basic"
			text: "Benefits"
			path: "/ts/concepts/benefits"
			file: "ts/concepts/benefits"
		}, {
			kind: "basic"
			text: "App Structure"
			path: "/ts/develop/app-structure"
			file: "ts/develop/app-structure"
		}, {
			kind: "basic"
			text: "Hello World"
			path: "/ts/concepts/hello-world"
			file: "ts/concepts/hello-world"
		}]
	}, {
		kind: "section"
		text: "Primitives"
		items: [{
			kind: "basic"
			text: "Services"
			path: "/ts/primitives/services"
			file: "ts/primitives/services"
		}, {
			kind: "accordion"
			text: "APIs"
			accordion: [{
				kind: "basic"
				text: "Defining APIs"
				path: "/ts/primitives/apis"
				file: "ts/primitives/apis"
			}, {
				kind: "basic"
				text: "Validation"
				path: "/ts/primitives/validation"
				file: "ts/primitives/validation"
			}, {
				kind: "basic"
				text: "API Calls"
				path: "/ts/primitives/api-calls"
				file: "ts/primitives/api-calls"
			}, {
				kind: "basic"
				text: "Raw Endpoints"
				path: "/ts/primitives/raw-endpoints"
				file: "ts/primitives/raw-endpoints"
			}, {
				kind: "basic"
				text: "GraphQL"
				path: "/ts/primitives/graphql"
				file: "ts/primitives/graphql"
			}, {
				kind: "basic"
				text: "Streaming APIs"
				path: "/ts/primitives/streaming-apis"
				file: "ts/primitives/streaming-apis"
			}, {
				kind: "basic"
				text: "API Errors"
				path: "/ts/develop/errors"
				file: "ts/develop/errors"
			}, {
				kind: "basic"
				text: "Static Assets"
				path: "/ts/primitives/static-assets"
				file: "ts/primitives/static-assets"
			}]
		}, {
			kind: "basic"
			text: "Databases"
			path: "/ts/primitives/databases"
			file: "ts/primitives/databases"
		}, {
			kind: "basic"
			text: "Cron Jobs"
			path: "/ts/primitives/cron-jobs"
			file: "ts/primitives/cron-jobs"
		}, {
			kind: "basic"
			text: "Pub/Sub"
			path: "/ts/primitives/pubsub"
			file: "ts/primitives/pubsub"
		}, {
			kind: "basic"
			text: "Secrets"
			path: "/ts/primitives/secrets"
			file: "ts/primitives/secrets"
		}]
	}, {
		kind: "section"
		text: "Development"
		items: [{
			kind: "basic"
			text: "Authentication"
			path: "/ts/develop/auth"
			file: "ts/develop/auth"
		}, {
			kind: "accordion"
			text: "ORMs"
			accordion: [{
				kind: "basic"
				text: "Overview"
				path: "/ts/develop/orms"
				file: "ts/develop/orms/overview"
			}, {
				kind: "basic"
				text: "Knex.js"
				path: "/ts/develop/orms/knex"
				file: "ts/develop/orms/knex"
			}, {
				kind: "basic"
				text: "Prisma"
				path: "/ts/develop/orms/prisma"
				file: "ts/develop/orms/prisma"
			}, {
				kind: "basic"
				text: "Drizzle"
				path: "/ts/develop/orms/drizzle"
				file: "ts/develop/orms/drizzle"
			}, {
				kind: "basic"
				text: "Sequelize"
				path: "/ts/develop/orms/sequelize"
				file: "ts/develop/orms/sequelize"
			}]
	  },{
			kind: "basic"
			text: "CORS"
			path: "/ts/develop/cors"
			file: "develop/cors"
		}, {
			kind: "basic"
			text: "Metadata"
			path: "/ts/develop/metadata"
			file: "ts/develop/metadata"
		}, {
			kind: "basic"
			text: "Testing"
			path: "/ts/develop/testing"
			file: "ts/develop/testing"
		}, {
			kind: "basic"
			text: "Logging"
			path: "/ts/develop/logging"
			file: "ts/develop/logging"
		}, {
			kind: "basic"
			text: "Debugging"
			path: "/ts/develop/debug"
			file: "ts/develop/debug"
		}]
	}, {
		kind: "section"
		text: "How to guides"
		items: [{
			kind: "basic"
			text: "Handle file uploads"
			path: "/ts/how-to/file-uploads"
			file: "how-to/file-uploads"
		}, {
			kind: "basic"
			text: "Use Vercel for frontend hosting"
			path: "/ts/how-to/vercel"
			file: "how-to/vercel"
		}, {
			kind: "basic"
			text: "Migrate from Express.js"
			path: "/ts/how-to/express-migration"
			file: "how-to/express-migration"
		}, {
			kind: "basic"
			text: "Use NestJS with Encore"
			path: "/ts/how-to/nestjs"
			file: "how-to/nestjs"
		}, {
			kind: "basic"
			text: "Use a template engine"
			path: "/ts/how-to/template-engine"
			file: "how-to/template-engine"
		}]
	}]
}

#DevelopmentSection: #SectionMenuItem & {
	kind: "section"
	text: "Development"
	items: [{
		kind:    "nav"
		text:    "Encore.go"
		path:    "/go"
		file:    "go/overview"
		submenu: #EncoreGO
		presentation: {
			icon:  "golang"
			style: "card"
		}
	}, {
		kind:    "nav"
		text:    "Encore.ts"
		path:    "/ts"
		file:    "ts/overview"
		submenu: #EncoreTS
		presentation: {
			icon:  "typescript"
			style: "card"
		}
	}, {
		kind: "basic"
		text: "CLI Reference"
		path: "/develop/cli-reference"
		file: "develop/cli-reference"
	}, {
		kind: "basic"
		text: "Client Generation"
		path: "/develop/client-generation"
		file: "develop/client-generation"
	}, {
		kind: "basic"
		text: "Infra Namespaces"
		path: "/develop/infra-namespaces"
		file: "develop/infra-namespaces"
	}]
}

#ObservabilitySection: #SectionMenuItem & {
	kind: "section"
	text: "Observability"
	items: [{
		kind: "basic"
		text: "Development Dashboard"
		path: "/observability/dev-dash"
		file: "observability/dev-dash"
	}, {
		kind: "basic"
		text: "Distributed Tracing"
		path: "/observability/tracing"
		file: "observability/tracing"
	}, {
		kind: "basic"
		text: "Flow Architecture Diagram"
		path: "/observability/encore-flow"
		file: "observability/encore-flow"
	}, {
		kind: "basic"
		text: "Service Catalog"
		path: "/develop/api-docs"
		file: "develop/api-docs"
	}]
}

#PlatformSection: #SectionMenuItem & {
	kind: "section"
	text: "Cloud Platform"
	items: [{
		kind: "basic"
		text: "Deploying & CI/CD"
		path: "/deploy/deploying"
		file: "deploy/deploying"
	}, {
		kind: "basic"
		text: "Environments"
		path: "/deploy/environments"
		file: "deploy/environments"
	}, {
		kind: "basic"
		text: "Infrastructure provisioning"
		path: "/deploy/infra"
		file: "deploy/infra"
	}, {
		kind: "basic"
		text: "Preview Environments"
		path: "/deploy/preview-environments"
		file: "deploy/preview-environments"
	}, {
		kind: "basic"
		text: "Metrics"
		path: "/observability/metrics"
		file: "observability/metrics"
	}, {
		kind: "basic"
		text: "Connect your cloud account"
		path: "/deploy/own-cloud"
		file: "deploy/own-cloud"
	}, {
		kind: "basic"
		text: "Neon Postgres"
		path: "/deploy/neon"
		file: "deploy/neon"
	}, {
		kind: "accordion"
		text: "Kubernetes deployment"
		accordion: [{
			kind: "basic"
			text: "Deploying to a new cluster"
			path: "/deploy/kubernetes"
			file: "deploy/kubernetes"
		}, {
			kind: "basic"
			text: "Import an existing cluster"
			path: "/how-to/import-kubernetes-cluster"
			file: "how-to/import-kubernetes-cluster"
		}, {
			kind: "basic"
			text: "Configure kubectl"
			path: "/deploy/kubernetes/kubectl"
			file: "deploy/configure-kubectl"
		}]
	}, {
		kind: "basic"
		text: "Custom Domains"
		path: "/deploy/custom-domains"
		file: "deploy/custom-domains"
	}, {
		kind: "basic"
		text: "Application Security"
		path: "/deploy/security"
		file: "deploy/security"
	}, {
		kind: "basic"
		text: "Webhooks"
		path: "/deploy/webhooks"
		file: "deploy/webhooks"
	}, {
		kind: "basic"
		text: "OAuth Clients"
		path: "/platform/oauth-clients"
		file: "platform/oauth-clients"
	}, {
		kind: "basic"
		text: "API Reference"
		path: "/platform/api-reference"
		file: "platform/api-reference"
	}]
}

#SelfHostSection: #SectionMenuItem & {
	kind: "section"
	text: "Self Hosting"
	items: [
		{
			kind: "basic"
			text: "Build Docker Images"
			path: "/self-host/docker-build"
			file: "how-to/self-host"
		}, {
			kind: "basic"
			text: "Configure Infrastructure"
			path: "/self-host/configure-infra"
			file: "selfhost/configure-infra"
		}, {
		  kind: "basic"
		  text: "Deploy to DigitalOcean"
		  path: "/self-host/deploy-digitalocean"
		  file: "selfhost/deploy-to-digital-ocean"
	}]
}

#ResourcesSection: #SectionMenuItem & {
	kind: "section"
	text: "Resources"
	items: [{
		kind: "accordion"
		text: "How to guides"
		accordion: [{
			kind: "basic"
			text: "Break a monolith into microservices"
			path: "/how-to/break-up-monolith"
			file: "how-to/break-up-monolith"
		}, {
			kind: "basic"
			text: "Generate Auth Keys"
			path: "/develop/auth-keys"
			file: "develop/auth-keys"
		}, {
			kind: "basic"
			text: "Integrate with GitHub"
			path: "/how-to/github"
			file: "how-to/github"
		}, {
			kind: "basic"
			text: "Integrate with a web frontend"
			path: "/how-to/integrate-frontend"
			file: "how-to/integrate-frontend"
		}, {
			kind: "basic"
			text: "Integrate with Terraform"
			path: "/deploy/terraform"
			file: "deploy/terraform"
		}, {
			kind: "basic"
			text: "Use Temporal with Encore"
			path: "/how-to/temporal"
			file: "how-to/temporal"
		}, {
			kind: "basic"
			text: "Submit a Template"
			path: "/how-to/submit-template"
			file: "how-to/submit-template"
		}]
	}, {
		kind: "accordion"
		text: "Migration guides"
		accordion: [{
			kind: "basic"
			text: "Try Encore for an existing project"
			path: "/how-to/try-encore"
			file: "how-to/try-encore"
		}, {
			kind: "basic"
			text: "Migrate an existing backend to Encore"
			path: "/how-to/migrate-to-encore"
			file: "how-to/migrate-to-encore"
		}, {
			kind: "basic"
			text: "Migrate away from Encore"
			path: "/how-to/migrate-away"
			file: "how-to/migrate-away"
		}]
	}, {
		kind: "accordion"
		text: "Product comparisons"
		accordion: [{
			kind: "basic"
			text: "Encore vs. Heroku"
			path: "/other/vs-heroku"
			file: "other/vs-heroku"
		}, {
			kind: "basic"
			text: "Encore vs. Supabase / Firebase"
			path: "/other/vs-supabase"
			file: "other/vs-supabase"
		}, {
			kind: "basic"
			text: "Encore vs. Terraform / Pulumi"
			path: "/other/vs-terraform"
			file: "other/vs-terraform"
		}]
	}]
}

#OtherSection: #SectionMenuItem & {
	kind: "section"
	text: "Other"
	items: [{
		kind: "basic"
		text: "Compliance & Security"
		path: "/about/compliance"
		file: "about/compliance"
	}, {
		kind: "basic"
		text: "Plans & billing"
		path: "/about/billing"
		file: "about/billing"
	}, {
		kind: "basic"
		text: "Telemetry"
		path: "/telemetry"
		file: "other/telemetry"
	}, {
		kind: "basic"
		text: "Roles & Permissions"
		path: "/about/permissions"
		file: "about/permissions"
	}, {
		kind: "basic"
		text: "Usage limits"
		path: "/about/usage"
		file: "about/usage"
	}]
}

#CommunitySection: #SectionMenuItem & {
	kind: "section"
	text: "Community"
	items: [{
		kind: "basic"
		text: "Contribute"
		path: "/community/contribute"
		file: "community/contribute"
	}, {
		kind: "basic"
		text: "Get involved"
		path: "/community"
		file: "community/index"
	}, {
		kind: "basic"
		text: "Open Source"
		path: "/community/open-source"
		file: "community/open-source"
	}, {
		kind: "basic"
		text: "Principles"
		path: "/community/principles"
		file: "community/principles"
	}]
}
